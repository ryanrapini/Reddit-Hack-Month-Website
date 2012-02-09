<!DOCTYPE html> 
<html>
	<head>
		<style type="text/css">
			body{
				padding-top: 40px;
				padding-left: 50px;
				padding-right: 50px;
			}
			p
			{
				text-align: justify;
			}
		</style>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>HackMonth 2012 - Home</title>
		<?php include('includes/scripts.include'); ?>
	</head>
	<body>
		<?php include('includes/header.include'); ?>
		
		<div class="container-fluid">
			<br>
			<h1>Tutorials</h1>
			<div class="row-fluid">
				<div class="span10">
					<table class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>Name</th>
								<th>Description</th>
								<th>Language</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><a href="http://schacon.gitdub.com/git/gittutorial.html">Gittutorial Manpages</td>
								<td>A simple tutorial introduction to git</td>
								<td>Git</td>
							</tr>
							<tr>
								<td><a href="http://learn.github.com/p/intro.html">Learn.Github's Introduction To Git</td>
								<td>A more verbose and thorough tutorial on Git, made by the very artsy people at github </td>
								<td>Git</td>
							</tr>
							<tr>
								<td><a href="http://learnpythonthehardway.org/">Learn Python The Hard Way</a></td>
								<td>Great for absolutely new programmers, though it can strengthen the skills of existing programmers too! The HTML version is free!</td>
								<td>Python</td>
							</tr>
							<tr>
								<td><a href="http://book.realworldhaskell.org/">Real World Haskell</a></td>
								<td>"Real World Haskell takes you through the basics of functional programming at a brisk pace, and then helps you increase your understanding of Haskell in real-world issues like I/O, performance, dealing with data, concurrency, and more as you move through each chapter." (Free Online)</td>
								<td>Haskell</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				<div class="span2">
					<h4>Got a tutorial to suggest?</h4>
					<p>Do you know of a great tutorial that taught you a language? Is there something you'd like to see added to this page?</p>
					<a href="http://redd.it/pi9ps" class="btn">Post it!</a>
				</div>
			</div>
		</div>

		<?php include('includes/footer.include'); ?>
	</body>
</html>						
