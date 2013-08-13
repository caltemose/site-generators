I gave a five-minute presentation for the [Atlanta Web Design Group](http://awdg.org) the evening of Thursday, June 27th, 2013 at [Hypepotamus](http://hypepotamus.com), the vibrant startup space in midtown Atlanta (thanks Heath, Kevin and Scott). The rough outline for this presentation was:

1. A brief history of the process for building HTML pages
2. The complexity of modern process
3. Modern tools for simplifying and automating our process
4. How to choose which tools are right for you

I concluded with a quick demo of how easy it is to modify, build and publish content using a modern static site generator (Middleman in this case). Q&amp;A followed. 

**I hope those of you who attended learned from my mistake and don't rely on data being in the clipboard for your presentations.** Weak sauce.

While there are many site generator apps and frameworks with a variety of different specialities and features, they all have the same core goal: to help you automate the tedious parts of your process for building sites. 


## Site Generator Apps

Here are the two site generator apps I discussed. Both run on the command-line and are fairly easy to install.

* [Wintersmith](http://wintersmith.io/)
* [Middleman](http://middlemanapp.com/)

For another general overview of site generators, [check out this article](http://www.mickgardner.com/2012/12/an-introduction-to-static-site.html) or [this github repo](https://github.com/skx/static-site-generators). There are useful lists of site generator tools [here](https://iwantmyname.com/blog/2011/02/list-static-website-generators.html) and [here](https://gist.github.com/davatron5000/2254924).

During the Q&amp;A session, a guy in the audience also mentioned [Octopress](http://octopress.org) which is a blogging framework built on [Jekyll](http://jekyllrb.com), a well-established site generator. I might have to check that out next. If you're that dude, [connect](http://twitter.com/caltemose).

### Using the command line

Setting up these apps requires use of the command line, Github and installing ruby gems and/or node modules. If you are uncomfortable with those kinds of tasks, find someone to help you learn. You'll be glad you did.


## Site Generator Features

Any process looking to expedite code generation for web sites is going to have  standard core features: templating systems, content storage systems and local http service. In the case of our apps, we use a templating language which gives us templates and usually some form of scripting. And for content storage we use lightweight markup languages which make it easy for us to focus on content while writing it rather than being distracted by HTML markup. These features could be expressed like so:

    templates + content + {some processing} = HTML files ready for browsing

Note that the ```{some processing}``` step could be just creating pages based on the content using the templates or it could include CSS processing, automatic sprite generation, file minification and concatenation, and deploying your files to a testing or live server. We'll get into these features below.


### Templating languages

I discussed [Jade](http://jade-lang.com) in the talk but there a large number of templating languages you can use to make it easier for you to create and maintain templates. These languages simplify the process of writing template HTML and give you the ability to add scripting to your page templates. Scripts you add to your templates are processed whenever you preview or publish your site. 

They aren't meant to do things like pull content from a database or process form uploads - that would require a live server-side language (PHP, Ruby, etc). 

They allow you to do things like change page content based on data contained in the initial lines of the file (called frontmatter) stored in a simple data format ([YAML](http://www.yaml.org/) in this case) that looks like this:

    ---
    title: Static Site Generators are Great
    ---


And your template (in .erb) might look like this:

<pre><code>&lt;title&gt;<%= <span class="content">data.page.title</span> =%>&lt;/title&gt;</code></pre>

Which when compiled would render this HTML:

<pre><code>&lt;title&gt;<span class="content">Static Site Generators are Great</span>&lt;/title&gt;</code></pre>

Or a Jade template might look like this:

<pre><code>title {<span class="content">page.metadata.title</span>}</code></pre>

To accomplish the same result.

We can use templates to describe complete types of pages or we can build templates for modules in a web application. Whatever you need.


### Includes

Includes allow you to store code needed on multiple pages in a single file that can be included in your templates and pages. This keeps you from having to edit the same code in multiple locations when you make changes. This feature is a subset of scripting and is usually provided by the templating language.

Here is an example from a .erb (eRuby) template (learn about [eRuby on Wikipedia](http://en.wikipedia.org/wiki/ERuby)):

<pre><code><%= partial <span class="content">"partials/header"</span> %>
</code></pre>

The code above would insert the file at ```./partials/header.erb``` into the current file. The contents of that header file might look something like this:

<pre><code>&lt;!DOCTYPE html&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;meta charset=<span class="content">"utf-8"</span>&gt;
    &lt;title&gt;<span class="content">Sample Page Title</span>&lt;/title&gt;
    &lt;link href=<span class="content">"/assets/css/main.css"</span> media=<span class="content">"screen"</span> rel=<span class="content">"stylesheet"</span> type=<span class="content">"text/css"</span> /&gt;
  &lt;/head&gt;
  &lt;body&gt;
</code></pre>


### Lightweight markup languages

Markdown is the language I mentioned in my presentation but there are many other simple markup languages you can use to ease the process of writing page content. These languages make writing web content easy since they abstract HTML markup into a simple and easy-to-read language. For instance, a typical web page might start like this:

<pre><code># This is a Primary Page Title
## This is a secondary title
	
Here is the first paragraph. An unordered list:

- **strong item 1**
- *emphasized item 2*
- [a link](http://i.link.it)
</code></pre>

And be rendered like this:

<pre><code>&lt;h1&gt;<span class="content">This is a Primary Page Title</span>&lt;/h2&gt;
&lt;h2&gt;<span class="content">This is a secondary title</span>&lt;/h2&gt;

&lt;p&gt;<span class="content">Here is the first paragraph. An unordered list:</span>&lt;/p&gt;

&lt;ul&gt;
   &lt;li&gt;&lt;strong&gt;<span class="content">strong item 1</span>&lt;/strong&gt;&lt;/li&gt;
   &lt;li&gt;&lt;em&gt;<span class="content">emphasized item 2</span>&lt;/em&gt;&lt;/li&gt;
   &lt;li&gt;&lt;a href="http://i.link.it"&gt;<span class="content">item 3</span>&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
</code></pre>

You get the idea.


### CSS Processing and Helpers

Modern site generators come with many more features than just templating and content storage. Most generators support a css-preprocessing language, usually [SASS](http://sass-lang.com). If you write CSS and aren't familiar with SASS or [LESS](http://lesscss.org), check them out. They give CSS some much-needed intelligence and shorthand. You can also expect support for the [Compass CSS authoring framework](http://compass-style.org).

To give you a taste of the benefits of using a css preprocessor, here's an example using SASS:

<pre><code>$linkColor: <span class="content">#2577A1</span>;

a {
   color: <span class="content">$linkColor</span>;

   &:hover {
      color: darken($linkColor, <span class="content">20%</span>);
   }
}</code></pre>

This sample shows ```variables```, built-in functions (```darken```) and CSS nesting (starting with ```&:hover```). This SASS would produce the following CSS when rendered:

<pre><code>a {
   color: <span class="content">#3333cc</span>;
}
a:hover {
   color: <span class="content">#123a4e</span>;
}
</code></pre>

There's a lot more power in using SASS or LESS or any of the other [css preprocessors](https://www.google.com/search?q=sass+tutorial&oq=sass+tutorial). If you write a lot of CSS and aren't using these tools, learn how to use them. They will save you much time.


### Uglifying: Minification and Compression

These days we expect our CSS and Javascript to be condensed to save file size. This means at a minimum removing all the white space from your CSS or JS files to reduce file size. It can also involve obfuscating your JS code so that parts of your code are reduced down to shorter variables and names to save space in the file (and/or make it harder for humans to read). In other words, your Javascript function here:

<pre><code>function updateNav(<span class="content">color</span>) {
  return $(<span class="content">'#nav a'</span>).css(<span class="content">'color', color</span>);
}</code></pre>

Would become something like this:

<pre><code>function updateNav(<span class="content">a</span>){return $(<span class="content">"#nav a"</span>).css(<span class="content">"color",a</span>)}</code></pre>

Most site generator apps have support for uglifying your code.


### CoffeeScript

*If you're just getting started with Javascript, or your JS is mainly simple stuff like basic jQuery calls, then you can probably skip over this section. CoffeeScript is best for those who write modular, application-like Javascript.*

Many site generators come with support for [CoffeeScript](http://coffeescript.org/) &ndash; a shorthand language for writing Javascript. If you write Javascript, you may find CoffeeScript useful for it's object-oriented approach to writing JS. It helps you write a bit less code to accomplish your JS needs.

For example, the function shown in the previous section would look like this as CoffeeScript:

<pre><code>updateNav = (color) ->
  $(<span class="content">"#nav a"</span>).css <span class="content">"color"</span>, <span class="content">color</span></code></pre>


## Moving on

I've touched on the primary features of site generator apps but they have even more features than what I've described. If improving and automating your process for building web sites is important to you, I'd encourage you to start using tools like these to make your work more enjoyable and get the computer to do the tedious parts.


Got questions? Ask away:

<a class="signature" href="http://twitter.com/caltemose">@caltemose</a>