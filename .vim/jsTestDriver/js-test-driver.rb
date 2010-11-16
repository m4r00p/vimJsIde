# Run JS Test Driver as part of autotest
# Supports Growl notifications if using autotest-growl
 
require 'autotest'
 
module Autotest::JsTestDriver
 
    @@jar = File.dirname(__FILE__) + '/JsTestDriver-1.0b.jar'
    @@config_file = 'jsTestDriver.conf'
 
    def self.jar=(string)
        @@jar = string
    end
 
    def self.config_file=(string)
        @@config_file = string
    end
 
    def self.show_success=(bool)
        @@show_success=bool
    end
 
 
    Autotest.add_hook :run_command do |at|
        # run js test driver
        results = 'JS Test Driver:'
        results += `java -jar "#{@@jar}" --config "#{@@config_file}" --tests all --verbose`
        puts results
 
        at.results = [] if at.results.nil?
        at.results.concat(results.split("\n"))
 
        at.hook :ran_js_test_driver
 
    end
 
end
 
#module Autotest::Growl
 
    #@@show_js_test_success = false
 
    #def self.show_js_test_success=(bool)
        #@@show_js_test_success=bool
    #end
 
  # Growl results of JS Test Driver
  #Autotest.add_hook :ran_js_test_driver do |autotest|
 
    #gist = autotest.results.grep( /Total\s+\d+\s+tests/ ).join(" / ").strip()
 
    #if gist == ''
      #growl @label + 'Cannot run JS Test Driver.', gist, 'error'
    #else
      #if gist =~ /Errors:\s+[1-9]\d*/
        #growl @label + 'Error running some JS tests.', gist, 'failed'
      #elsif gist =~ /Fails:\s+[1-9]\d*/
        #growl @label + 'JS Test: Some tests failed.', gist, 'failed'
      #elsif @@show_js_test_success
        #growl @label + 'JS Test: All files are clean.', gist, 'passed'
      #end
    #end
    #false
  #end
 
#end
