{:user {:plugins [[cider/cider-nrepl "0.22.0"]
                  [venantius/ultra "0.6.0"]
                  [com.billpiel/sayid "0.0.17"]
                  [com.jakemccrary/lein-test-refresh "0.24.1"]]
        :dependencies [[vvvvalvalval/scope-capture "0.3.2"]
                       [org.clojure/tools.namespace "0.2.11"]
                       [pjstadig/humane-test-output "0.9.0"]]
        :injections [(require 'sc.api)
                     (require '(clojure.tools.namespace repl))
                     (require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}}
