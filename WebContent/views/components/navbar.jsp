<%--
  Created by IntelliJ IDEA.
  User: ernest
  Date: 4/7/19
  Time: 7:23 AM
  To change this template use File | Settings | File Templates.
--%>
<nav class="navbar navbar-dark" style="background-color: #1c313a;">
   <%-- <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-info">
            &lt;%&ndash;<i class="fas fa-align-left"></i>&ndash;%&gt;
            <i class="fas fa-bars fa-align-left"></i>
            &lt;%&ndash;<span>Toggle Sidebar</span>&ndash;%&gt;
        </button>
    </div>--%>

    <a class="navbar-brand" href="#">
        <img src="img/infusion-activity.png" alt="">
    </a>

    <div class="justify-content-end">
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-user-circle"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="#">Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
