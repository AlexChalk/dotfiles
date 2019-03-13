{:user {:plugins [[cider/cider-nrepl "0.21.0"]
                  [venantius/ultra "0.6.0"]
                  [com.billpiel/sayid "0.0.17"]
                  [com.jakemccrary/lein-test-refresh "0.23.0"]]
        :dependencies [[vvvvalvalval/scope-capture "0.3.2"]
                       [pjstadig/humane-test-output "0.9.0"]]
        :injections [(require 'sc.api)
                     (require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}}
