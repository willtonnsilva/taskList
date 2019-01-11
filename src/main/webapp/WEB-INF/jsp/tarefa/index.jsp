<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Task List</title>
</head>
<style type="text/css">
    .wrapper {
	    display: flex;
	    width: 100%;
	    align-items: stretch;
	}
	
	#sidebar {
	    min-width: 250px;
	    max-width: 250px;
	}

	#sidebar.active {
	    margin-left: -250px;
	}
	
	#sidebar {
	    min-width: 250px;
	    max-width: 250px;
	    min-height: 100vh;
	}
	
	a[data-toggle="collapse"] {
    	position: relative;
	}

	.dropdown-toggle::after {
	    display: block;
	    position: absolute;
	    top: 50%;
	    right: 20px;
	    transform: translateY(-50%);
	}
	
	@media (max-width: 768px) {
	    #sidebar {
	        margin-left: -250px;
	    }
	    #sidebar.active {
	        margin-left: 0;
	    }
	}
	
	@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";


	body {
	    font-family: 'Poppins', sans-serif;
	    background: #fafafa;
	}
	
	p {
	    font-family: 'Poppins', sans-serif;
	    font-size: 1.1em;
	    font-weight: 300;
	    line-height: 1.7em;
	    color: #999;
	}
	
	a, a:hover, a:focus {
	    color: inherit;
	    text-decoration: none;
	    transition: all 0.3s;
	}
	
	#sidebar {
	    /* don't forget to add all the previously mentioned styles here too */
	    background: #7386D5;
	    color: #fff;
	    transition: all 0.3s;
	}
	
	#sidebar .sidebar-header {
	    padding: 20px;
	    background: #6d7fcc;
	}
	
	#sidebar ul.components {
	    padding: 20px 0;
	    border-bottom: 1px solid #47748b;
	}
	
	#sidebar ul p {
	    color: #fff;
	    padding: 10px;
	}
	
	#sidebar ul li a {
	    padding: 10px;
	    font-size: 1.1em;
	    display: block;
	}
	#sidebar ul li a:hover {
	    color: #7386D5;
	    background: #fff;
	}
	
	#sidebar ul li.active > a, a[aria-expanded="true"] {
	    color: #fff;
	    background: #6d7fcc;
	}
	ul ul a {
	    font-size: 0.9em !important;
	    padding-left: 30px !important;
	    background: #6d7fcc;
	}
	
	#sidebarCollapse {
	    width: 40px;
	    height: 40px;
	    background: #f5f5f5;
	}
	
	#sidebarCollapse span {
	    width: 80%;
	    height: 2px;
	    margin: 0 auto;
	    display: block;
	    background: #555;
	    transition: all 0.8s cubic-bezier(0.810, -0.330, 0.345, 1.375);
	}
	
	#sidebarCollapse span:first-of-type {
    /* rotate first one */
    transform: rotate(45deg) translate(2px, 2px);
	}
	#sidebarCollapse span:nth-of-type(2) {
	    /* second one is not visible */
	    opacity: 0;
	}
	#sidebarCollapse span:last-of-type {
	    /* rotate third one */
	    transform: rotate(-45deg) translate(1px, -1px);
	}
	
	#sidebarCollapse.active span {
	    /* no rotation */
	    transform: none;
	    /* all bars are visible */
	    opacity: 1;
	    margin: 5px auto;
	}
	
	.wrapper {
    display: flex;
    align-items: stretch;
    perspective: 1500px; 
	}

	#sidebar {
	    min-width: 250px;
	    max-width: 250px;
	    background: #7386D5;
	    color: #fff;
	    transition: all 0.6s cubic-bezier(0.945, 0.020, 0.270, 0.665);
	    transform-origin: center left; /* Set the transformed position of sidebar to center left side. */
	}
	
	#sidebar.active {
	    margin-left: -250px;
	    transform: rotateY(100deg); /* Rotate sidebar vertically by 100 degrees. */
	}
		
	@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
        transform: rotateY(100deg);
    }
    #sidebar.active {
        margin-left: 0;
        transform: none;
    }
    
    #sidebarCollapse span:first-of-type,
    #sidebarCollapse span:nth-of-type(2),
    #sidebarCollapse span:last-of-type {
        transform: none;
        opacity: 1;
        margin: 5px auto;
    }

    #sidebarCollapse.active span {
        margin: 0 auto;
    }
    #sidebarCollapse.active span:first-of-type {
        transform: rotate(45deg) translate(2px, 2px);
    }
    #sidebarCollapse.active span:nth-of-type(2) {
        opacity: 0;
    }
    #sidebarCollapse.active span:last-of-type {
        transform: rotate(-45deg) translate(1px, -1px);
    }
}

</style>

<script type="text/javascript">
	$(document).ready(function () {
	
	    $('#sidebarCollapse').on('click', function () {
	        $('#sidebar').toggleClass('active');
	    });
	
	});
</script>

<body>
	
	<div class="wrapper">

	    <!-- Sidebar -->
	    <nav id="sidebar">
		    
		    <div class="sidebar-header">
	            <h3>Task List</h3>
	        </div>
	        
	        <ul class="list-unstyled components">
	            <li class="active">
	                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Tarefas Abertas</a>
	                <ul class="collapse list-unstyled" id="homeSubmenu">
	                    <li>
	                        <a href="#">Home 1</a>
	                    </li>
	                    <li>
	                        <a href="#">Home 2</a>
	                    </li>
	                    <li>
	                        <a href="#">Home 3</a>
	                    </li>
	                </ul>
	            </li>
	            <li>
	                <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Tarefas Concluídas</a>
	                <ul class="collapse list-unstyled" id="pageSubmenu">
	                    <li>
	                        <a href="#">Page 1</a>
	                    </li>
	                    <li>
	                        <a href="#">Page 2</a>
	                    </li>
	                    <li>
	                        <a href="#">Page 3</a>
	                    </li>
	                </ul>
	            </li>
	        </ul>
		        
	    </nav>
	
	    <div id="content">
            <button type="button" id="sidebarCollapse" class="navbar-btn">
                <span></span>
                <span></span>
                <span></span>
            </button>
        <div>
	</div> 
	
<%-- 	<form action="<c:url value="/" />" method="GET">
		<input type="text" name="tarefa.titulo"/>
		<input type="text" name="tarefa.status"/>
		<input type="submit" value="gravar">
	</form> --%>
	
</body>
</html>