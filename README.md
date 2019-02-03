## Rack-Simple
[Demo](https://racksimle.herokuapp.com)
![rack-simple](https://github.com/demesvardestin/rack-simple/raw/master/public/images/rack-simple.png "rack-simple")

This is a simple, super watered-down rack-based app template. It demonstrates
some high-level rack features such as the ```env``` variable, use of ```middleware```
such as ```Rack::Static```, and the overall Request/Response cycle.

### Purpose

On a macro level, this app has no real production potential. But it attempts to break down
what happens under the hood at the lower-level in some Rails features such as routing,
controller actions and rendering. To that end, I've added quite a few comments and
remarks to explain some of the key steps in the process.

### Installation & Usage

Fork/Clone this repo, run ```bundle install```, then run ```rackup``` within
the project's directory.

### Links/Further Reading

- Adam Gamble's [tutorial](https://isotope11.com/blog/build-your-own-web-framework-with-rack-and-ruby-part-2 "Isotope Eleven")
- Rack's [Website](rack.github.io "Rack Official Website")