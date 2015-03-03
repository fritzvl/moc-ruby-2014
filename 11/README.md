Lesson 11.Rails
------------------

RubyOnRails web application framework
---------------

* Rails overview
* Rails main components
* RESTful applications
      * Stateless
      * Cacheable
      * Layered system
      * Code on demand(optional)
      * Uniform interface
        1. Identification of resource
        2. Manipulation of resources through these representations
        3. Self-descriptive message
        4. Hypermedia as the engine of application state(HATEOAS)
* Rails routing
* Rails naming conventions
* Rails controllers parameters
* Rails controllers
* Controllers filters
* Rescue in controllers

* Testing routing and controllers


* Useful links
    http://edgeguides.rubyonrails.org/routing.html
    http://edgeguides.rubyonrails.org/action_controller_overview.html

* Examples
  * https://github.com/fritzvl/moc-ruby-2014/tree/master/11/examples



* Machine-like URL
  /weather_services/1/20150301/temperature/:lat/:long
  /weather_services/1/20150301/humidity/:lat/:long
* Human-like URL
  /weather/:lat/:long
  /weather/:lat/:long/services