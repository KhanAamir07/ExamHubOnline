<!doctype html>

<html class="no-js " lang="en">


<head>

<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=Edge">

<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<meta name="description"
	content="Responsive Bootstrap 4 and web Application ui kit.">

<title>:: ExamPortal Admin :: Examination</title>


<!-- Bootstrap -->

 <link rel="icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/favicon.ico?v=3">

<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet"
	href="assets/css/style.min.css">

<link rel="stylesheet"
	href="assets/plugins/jquery-datatable/dataTables.bootstrap4.min.css">


<style>

/* =========================================================
   ADMIN SIDEBAR FIX
   ========================================================= */

#leftsidebar {
	position: fixed !important;
	top: 0 !important;
	left: 0 !important;
	height: 100vh !important;
	width: 260px;
	overflow-y: auto !important;
	overflow-x: hidden !important;
	z-index: 9999 !important;
}


/* Hide sidebar scrollbar but keep scrolling */

#leftsidebar::-webkit-scrollbar {
	width: 4px;
}

#leftsidebar::-webkit-scrollbar-thumb {
	background: rgba(0, 0, 0, 0.15);
	border-radius: 10px;
}


/* =========================================================
   PROFILE AREA
   ========================================================= */

#leftsidebar .user-info {
	display: flex !important;
	align-items: center !important;
	padding: 18px 15px !important;
}


/* Small circular profile image */
/* Profile image container */
#leftsidebar .user-info > a {
	width: 55px !important;
	height: 55px !important;
	min-width: 55px !important;
	display: block !important;
	border-radius: 50% !important;
	overflow: hidden !important;
	background: #f1f5f9 !important;
	border: 2px solid #e5e7eb !important;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08) !important;
}

/* Zoom the actual photo so face looks bigger */
#leftsidebar .user-info > a img {
	width: 100% !important;
	height: 100% !important;
	display: block !important;
	border-radius: 50% !important;
	object-fit: cover !important;
	object-position: center 10% !important;
	transform: scale(2.4) !important;
}


/* Profile name */

#leftsidebar .user-info .detail {
	margin-left: 11px !important;
	min-width: 0 !important;
}

#leftsidebar .user-info .detail h6 {
	margin: 0 0 4px 0 !important;
	font-size: 13px !important;
	font-weight: 700 !important;
	color: #222 !important;
	text-transform: uppercase;
	white-space: nowrap;
}

#leftsidebar .user-info .detail small {
	font-size: 11px !important;
	color: #777 !important;
	white-space: nowrap;
}


/* =========================================================
   SIDEBAR MENU
   ========================================================= */

#leftsidebar .menu {
	padding-bottom: 25px !important;
}

#leftsidebar .menu .list > li > a {
	padding: 13px 18px !important;
}

#leftsidebar .menu .list > li > a span {
	font-size: 14px !important;
}


/* =========================================================
   NAVBAR BRAND
   ========================================================= */

#leftsidebar .navbar-brand {
	height: 70px !important;
	display: flex !important;
	align-items: center !important;
}


/* =========================================================
   BODY / CONTENT SAFETY
   ========================================================= */

/*
 * Keep main page content away from fixed sidebar.
 * Existing theme may already provide this, so this is
 * intentionally only applied on desktop.
 */

@media (min-width: 1200px) {

	.content {
		margin-left: 0;
	}

}


/* =========================================================
   MOBILE SIDEBAR
   ========================================================= */

@media (max-width: 1199px) {

	#leftsidebar {
		width: 260px;
	}

}


/* =========================================================
   PROFILE IMAGE RESPONSIVE
   ========================================================= */

@media (max-width: 600px) {

	#leftsidebar .user-info {
		padding: 15px 12px !important;
	}

	#leftsidebar .user-info > a {
		width: 42px !important;
		height: 42px !important;
		min-width: 42px !important;
	}

}

</style>


</head>


<body class="theme-blush">


<!-- =========================================================
     OVERLAY
========================================================= -->

<div class="overlay"></div>


<!-- =========================================================
     MAIN SEARCH
========================================================= -->

<div id="search">

	<button
		id="close"
		type="button"
		class="close btn btn-primary btn-icon btn-icon-mini btn-round">
		x
	</button>


	<form>

		<input
			type="search"
			value=""
			placeholder="Search..." />


		<button
			type="submit"
			class="btn btn-primary">
			Search
		</button>

	</form>

</div>



<!-- =========================================================
     RIGHT ICON MENU
========================================================= -->

<div class="navbar-right">

	<ul class="navbar-nav">


		<li>

			<a
				href="report.jsp"
				class="app_calendar"
				title="Reports">

				<i class="zmdi zmdi-chart"></i>

			</a>

		</li>


		<li>

			<a
				href="#"
				class="mega-menu"
				title="File Manager">

				<i class="zmdi zmdi-folder"></i>

			</a>

		</li>


		<li>

			<a
				href="#"
				class="mega-menu"
				title="Cart">

				<i class="zmdi zmdi-shopping-cart"></i>

			</a>

		</li>


		<li>

			<a
				href="#"
				class="mega-menu"
				title="Authentication">

				<i class="zmdi zmdi-lock"></i>

			</a>

		</li>


		<li>

			<a
				href="auth?logout"
				class="mega-menu"
				title="Sign Out">

				<i class="zmdi zmdi-power"></i>

			</a>

		</li>


	</ul>

</div>



<!-- =========================================================
     LEFT SIDEBAR
========================================================= -->

<aside
	id="leftsidebar"
	class="sidebar">


	<!-- =====================================================
	     BRAND
	===================================================== -->

	<div class="navbar-brand">


		<button
			class="btn-menu ls-toggle-btn"
			type="button">

			<i class="zmdi zmdi-menu"></i>

		</button>


		<a href="home.jsp">

			<img
				src="assets/images/logo.svg"
				width="25"
				alt="ExamPortal">


			<span class="m-l-10">

				<b>ExamPortal</b>

			</span>

		</a>


	</div>



	<!-- =====================================================
	     MENU
	===================================================== -->

	<div class="menu">

		<ul class="list">


			<!-- ===============================================
			     ADMIN PROFILE
			=============================================== -->

			<li>

				<div class="user-info">


					<a href="profile.html">

						<img
							src="assets/images/image-gallery/Picture-2.png"
							alt="User">

					</a>


					<div class="detail">

						<h6>
							Aamir Khan
						</h6>


						<small>
							Website Admin
						</small>

					</div>


				</div>

			</li>



			<!-- ===============================================
			     DASHBOARD
			=============================================== -->

			<li>

				<a href="home.jsp">

					<i class="zmdi zmdi-home"></i>

					<span>
						Dashboard
					</span>

				</a>

			</li>



			<!-- ===============================================
			     EXAM CATEGORY
			=============================================== -->

			<li>

				<a
					href="categoryServlet?operation=viewAllCategories"
					class="menu-toggle">

					<i class="zmdi zmdi-assignment"></i>

					<span>
						Exam Category
					</span>

				</a>

			</li>



			<!-- ===============================================
			     EXAM SUB CATEGORY
			=============================================== -->

			<li>

				<a
					href="examServlet?operation=view"
					class="menu-toggle">

					<i class="zmdi zmdi-assignment"></i>

					<span>
						Exam SubCategory
					</span>

				</a>

			</li>



			<!-- ===============================================
			     MANAGE SECTION
			=============================================== -->

			<li>

				<a
					href="sectionServlet?operation=view"
					class="menu-toggle">

					<i class="zmdi zmdi-map"></i>

					<span>
						Manage Section
					</span>

				</a>

			</li>



			<!-- ===============================================
			     MANAGE QUESTION
			=============================================== -->

			<li>

				<a
					href="questionServlet?operation=view"
					class="menu-toggle">

					<i class="zmdi zmdi-swap-alt"></i>

					<span>
						Manage Question
					</span>

				</a>

			</li>



			<!-- ===============================================
			     MANAGE TEST
			=============================================== -->

			<li>

				<a
					href="testServlet?operation=view"
					class="menu-toggle">

					<i class="zmdi zmdi-copy"></i>

					<span>
						Manage Test
					</span>

				</a>

			</li>



			<!-- ===============================================
			     RESULTS
			=============================================== -->

			<li>

				<a
					href="resultServlet?operation=viewAllResult"
					class="menu-toggle">

					<i class="zmdi zmdi-time"></i>

					<span>
						Results
					</span>

				</a>

			</li>



			<!-- ===============================================
			     REPORT
			=============================================== -->

			<li>

				<a
					href="report.jsp"
					class="menu-toggle">

					<i class="zmdi zmdi-chart"></i>

					<span>
						Report
					</span>

				</a>

			</li>


		</ul>

	</div>


</aside>


</body>

</html>