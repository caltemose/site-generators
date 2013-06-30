<h1>
	Let the Computer Do the Work
	<small>Improving Your Site-Building Process with Site Generator Tools</small>
	<a href="http://twitter.com/caltemose">@caltemose</a>
</h1>

I gave a five-minute presentation for the [Atlanta Web Design Group](http://awdg.org) the evening of Thursday, June 27th, 2013. I spoke at [Hypepotamus](http://hypepotamus.com), the vibrant startup space in midtown Atlanta (thanks Heath, Kevin and Scott). The rough outline for this presentation was:

1. A brief history of the process for building HTML pages
2. The complexity of modern process
3. Modern tools for simplifying and automating our process
4. How to choose which tools are right for you

I concluded with a quick demo of how easy it is to modify, build and publish content using a modern static site generator (Middleman in this case). Q&amp;A followed. 

**I hope those of you who attended learned from my mistake and don't rely on data being in the clipboard for your presentations.** Weak sauce.

While there are many site generator apps and frameworks with a variety of different specialities and features, they all have the same core goal which is to help you automate the tedious parts of your process for building sites. Let's get into their feature sets.

## Site Generator Features

### Includes

Includes allow you to store code that appears on every page in a single file that can be included in your templates and pages so that you do not have to edit the same code in multiple locations when you make changes.

Here's an example from a .erb template (learn about ERB here or here):

	<%= partial "partials/header" %>

The code above would insert the file at ```./partials/header.erb``` into the current file. In this case that would include the HTML code that appears above the ```<body>``` tag.


### Templating languages

I discussed [Jade](http://jade-lang.com) in the talk but there a large number of templating languages you can use to make it easier for you to create and maintain templates. These languages simplify the process of writing template HTML and give you the ability to add scripting to your page templates. Scripts you add into your templates are processed whenever you publish your site. They aren't meant to do things like pull content from a database or process form uploads - that would require a live server-side language (PHP, Ruby, etc). They do allow you to do things like change page content based on data contained in the initial lines of the file stored in a simple data format ([YAML](http://www.yaml.org/) in this case) that looks like this:

	---
	title: Static Site Generators are Great
	---

And your template might look like this:

	<title><%= data.page.title =%></title>

Which when compiled would render this HTML:

	<title>Static Site Generators are Great</title>



### Markup languages

Markdown is the language I mentioned in my presentation but there are many other simple markup languages you can use to simplify the process of writing page content. These languages make writing web page content very easy since they abstract HTML markup into a simple and easy-to-read language. For instance:

* # - Makes a header using an &lt;h1&gt; tag
* ## - Makes a header using an &lt;h2&gt; tag
* * - Emphasizes content with &lt;em&gt;
* ** - Emphasizes content with &lt;strong&gt;

You get the idea.

### CSS Processing and Helpers

Site generators generally come with a css-preprocessing language, usually [SASS](http://sass-lang.com). I'm not going to go into their functionality here but if you write CSS and aren't familiar with SASS or LESS, you should definitely check them out. They give CSS some much-needed intelligence. You can also expect support for the [Compass](http://compass-style.org) framework.

### Minifying and uglifying

These days we expect our CSS and Javascript to be minified to improve performance. This means at a minimum removing all the white space from your CSS or JS files to reduce file size. It can also involve simplifying your JS code so that your function and variable names are reduced down to short names to save space in the file. In other words, your function ```changePageBackground()``` could become ```c()```. The computer doesn't care what your function names are so why not shorten them?


## Site Generator Apps

Here are the two site generator apps I discussed. Both run on the command-line.

* [Wintersmith](http://wintersmith.io/)
* [Middleman](http://middlemanapp.com/)

There are many more static site generators. For another general overview of site generators, [check out this article](http://www.mickgardner.com/2012/12/an-introduction-to-static-site.html). It does a pretty good job of defining static site generators.

Here some graphical site generator apps I mentioned which may be more appropriate if you're not comfortable with using the command line: 

* [Codekit](http://incident57.com/codekit/‎)
* [Hammer For Mac](http://hammerformac.com)


