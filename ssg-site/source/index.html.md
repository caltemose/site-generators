<h1>
	Let the Computer Do the Work
	<small>Improving Your Site-Building Process with Site Generator Tools</small>
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

I discussed [Jade](http://jade-lang.com) in the talk but there a large number of templating languages you can use to make it easier for you to create and maintain templates. These languages simplify the process of writing template HTML and give you the ability to add scripting to your page templates. Scripts you add to your templates are processed whenever you preview or publish your site. 

They aren't meant to do things like pull content from a database or process form uploads - that would require a live server-side language (PHP, Ruby, etc). 

They allow you to do things like change page content based on data contained in the initial lines of the file stored in a simple data format ([YAML](http://www.yaml.org/) in this case) that looks like this:

	---
	title: Static Site Generators are Great
	---

And your template might look like this:

	<title><%= data.page.title =%></title>

Which when compiled would render this HTML:

	<title>Static Site Generators are Great</title>



### Markup languages

Markdown is the language I mentioned in my presentation but there are many other simple markup languages you can use to simplify the process of writing page content. These languages make writing web page content very easy since they abstract HTML markup into a simple and easy-to-read language. For instance, a typical web page might start like this:

	# This is a Primary Page Title
	## This is a secondary title
	
	Here is the first paragraph. An unordered list:

	- **strong item 1**
	- *emphasized item 2*
	- [a link](http://i.link.it)

And be rendered like this:

	<h1>This is a Primary Page Title</h2>
	<h2>This is a secondary title</h2>
	
	<p>Here is the first paragraph. An unordered list:</p>

	<ul>
		<li><strong>strong item 1</strong></li>
		<li><em>emphasized item 2</em></li>
		<li><a href="http://i.link.it">item 3</a></li>
	</ul>

You get the idea.


### CSS Processing and Helpers

Site generators generally come with a css-preprocessing language, usually [SASS](http://sass-lang.com). I'm not going to go into their functionality here but if you write CSS and aren't familiar with SASS or [LESS](http://lesscss.org), check them out. They give CSS some much-needed intelligence. You can also expect support for the [Compass](http://compass-style.org) styling framework.

### Uglifying: Minification and Compression

These days we expect our CSS and Javascript to be shrunk to improve performance. This means at a minimum removing all the white space from your CSS or JS files to reduce file size. It can also involve obfuscating your JS code so that your function and variable names are reduced down to short names to save space in the file. In other words, your function ```closeNavigation()``` could become ```c()``` to save file size. 

Most site generator apps have support for uglifying your code.


### CoffeeScript

Many site generators come with support for [CoffeeScript](http://coffeescript.org/) -- a shorthand language for writing Javascript. If you write Javascript, you may find CoffeeScript useful for it's object-oriented approach to writing JS. It also allows you to write a bit less code to accomplish your JS tasks.

If you're just getting started with Javascript, or your JS is mainly simple stuff like basic jQuery calls, then you can probably skip over CoffeeScript for the moment. CoffeeScript is best for those of us who write more application-level Javascript.


## Site Generator Apps

Here are the graphical site generator apps I mentioned which may be more appropriate if you're not comfortable with using the command line: 

* [Codekit](http://incident57.com/codekit/‎)
* [Hammer For Mac](http://hammerformac.com)

Here are the two site generator apps I discussed. Both run on the command-line and are fairly easy to install.

* [Wintersmith](http://wintersmith.io/)
* [Middleman](http://middlemanapp.com/)

For another general overview of site generators, [check out this article](http://www.mickgardner.com/2012/12/an-introduction-to-static-site.html) or [this github repo](https://github.com/skx/static-site-generators). There are useful lists of site generator tools [here](https://iwantmyname.com/blog/2011/02/list-static-website-generators.html) and [here](https://gist.github.com/davatron5000/2254924).

During the Q&amp;A session, a guy in the audience also mentioned [Octopress](http://octopress.org) which is a blogging framework built on [Jekyll](http://jekyllrb.com), a well-established site generator. I might have to check that out next. If you're that dude, connect.

Got questions? Ask away:

<a class="signature" href="http://twitter.com/caltemose">@caltemose</a>