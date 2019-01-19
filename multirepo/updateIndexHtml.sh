#!/bin/bash

echo '<html><head>
<meta charset="UTF-8">
<title>OpenGrok Multi-repo list</title>
</head>
<body>
<p>
<h3>OpenGrok Multi-repo list</h3>
<p></p>
<ul>'

ls -tr  ${VAR_OPENGROK_ROOT} | xargs -L1 -IRR echo '<li><a href=RR>RR</a></li>'

echo '</ul>
</body></html>
'



