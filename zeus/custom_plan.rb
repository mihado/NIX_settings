require 'zeus/rails'

class CustomPlan < Zeus::Rails

  def default_bundle_with_test_env
    # Zeus by default loads the initial bundles with the development env.
    # This seems to break a lot of tests, so set the environment to test sooner.

    # Set the environment to test before we load the default bundle
    ::Rails.env = ENV['RAILS_ENV'] = 'test'

    # Mehtod built into Zeus::Rails
    default_bundle
  end

  def server_test
    server
  end

  def rake_test
    prerake
    rake
  end
end

Zeus.plan = CustomPlan.new
