


<!DOCTYPE html>

<html lang="en">

<head>

    {% block head %}
    <link rel="stylesheet" href="bootstrap.css" />
    <link rel="stylesheet" href="custom.css" />
    
    {% endblock %}
</head>

<body class="">
<script src="jquery.min.js"></script>
    <script src="bootstrap.min.js"></script>
    <div>
    {% extends 'basic.tpl'%}
        {% block markdowncell -%}
        {% endblock markdowncell %}

    </div>
    
</body>


