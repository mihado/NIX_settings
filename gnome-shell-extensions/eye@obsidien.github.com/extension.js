/*
 * Copyright (C) 2011   Azathoth		<azathoth92@hotmail.it>
 * Copyright (C) 2012   Arnaud Bonatti	<arnaud.bonatti@gmail.com>
 *
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301,
 * USA.
 */

const Cairo		= imports.cairo
const Config	= imports.misc.config
const Clutter	= imports.gi.Clutter
const Lang		= imports.lang
const Main		= imports.ui.main
const Mainloop	= imports.mainloop
const Panel		= imports.ui.panel
const St		= imports.gi.St

const UPDATE_INTERVAL_ms= 100
const EYE_LINE_WIDTH_px	= 1.5
const RELIEF_FACTOR		= 6
const MARGIN_px			= 4
const IRIS_MOVE			= 0.66
const IRIS_SIZE			= 0.55
const PUPIL_MOVE		= 0.44
const PUPIL_SIZE		= 0.15
const TWO_PI			= 2 * Math.PI

const EyeActor = new Lang.Class({
	Name: 'EyeActor',
	Extends: St.DrawingArea,
	
	_init: function(size) {
		this.parent({ width:size, height:size })
		this.halfsize = size/2.0
		
		this._repaint_handler = this.connect("repaint", Lang.bind(this, this.paint_eye))
		this._updater_handler = Mainloop.timeout_add(UPDATE_INTERVAL_ms, Lang.bind(this, function() {
			this.queue_repaint()
			return true
		}))
	},
	paint_eye: function() {
		let [area_x, area_y] = this.get_transformed_position()
		let [mouse_x, mouse_y, mask] = global.get_pointer()
		mouse_x -= area_x + this.halfsize
		mouse_y -= area_y + this.halfsize
		
		let eye_rad = this.halfsize - EYE_LINE_WIDTH_px/2
		
		let factor = Math.sqrt(mouse_x*mouse_x + mouse_y*mouse_y) / (RELIEF_FACTOR*eye_rad)
		if (factor > 1) factor = 1
		let iris_move = eye_rad * IRIS_MOVE * factor
		
		let cr = this.get_context()
		let theme_node = this.get_theme_node()
		Clutter.cairo_set_source_color(cr, theme_node.get_foreground_color())
		
		cr.translate(this.halfsize, this.halfsize)
		
		cr.setLineWidth(EYE_LINE_WIDTH_px)
		cr.arc(0, 0, eye_rad, 0, TWO_PI)
		cr.stroke()
		
		cr.setLineWidth(0)		// iris and pupil are filled
		cr.rotate(Math.PI/2 - Math.atan2(mouse_x, mouse_y))
		cr.translate(iris_move, 0)
		cr.scale(Math.cos(factor), 1)
		
		cr.arc(0, 0, eye_rad * IRIS_SIZE, 0, TWO_PI)
		cr.translate(iris_move * PUPIL_MOVE, 0.0)
		cr.newSubPath()
		cr.arc(0, 0, eye_rad * PUPIL_SIZE, 0, TWO_PI)
		cr.setFillRule(Cairo.FillRule.EVEN_ODD)
		cr.fillPreserve()
		
		cr.save()
		cr.restore()
	},
	byebye: function() {
		if (this._repaint_handler) this.disconnect(this._repaint_handler)
		if (this._updater_handler) Mainloop.source_remove(this._updater_handler)
	}
})

let oldactor = null, eye_area = null
let statusArea
function init(metadata) {
	let current_version = Config.PACKAGE_VERSION.split('.')
	if (current_version.length != 4 || current_version[0] != 3) throw new Error("Strange version number (extension.js:102).")
		
	switch (current_version[1]) {
		case"4": statusArea = Main.panel._statusArea
			break
		case"6": statusArea = Main.panel.statusArea
			break
		default: throw new Error("Strange version number (extension.js:109).")
	}
}

function enable() {	
	eye_area = new EyeActor(Panel.PANEL_ICON_SIZE - 2 * MARGIN_px)
	
	let a11y = statusArea.a11y.actor
	oldactor = a11y.get_children()[0]
	a11y.remove_all_children()
	a11y.add_actor(eye_area)
	
	eye_area.queue_repaint()
}

function disable() {
	let a11y = statusArea.a11y.actor
	a11y.remove_all_children()
	a11y.add_actor(oldactor)
	oldactor = null
	
	eye_area.byebye()
	eye_area.destroy()
	eye_area = null
}
