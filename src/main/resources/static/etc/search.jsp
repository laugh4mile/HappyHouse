<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>검색 화면</title>
<link href="css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
    crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
    crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
            <i class="fas fa-bars"></i>
        </button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..."
                    aria-label="Search" aria-describedby="basic-addon2" />
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="userDropdown"
                    href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                    aria-expanded="false">
                    <i class="fas fa-user fa-fw"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">Settings</a>
                    <a class="dropdown-item" href="#">Activity Log</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="login.jsp">Logout</a>
                </div></li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="index.jsp">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-tachometer-alt"></i>
                            </div>
                            Dashboard
                        </a>
                        <div class="sb-sidenav-menu-heading">Interface</div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse"
                            data-target="#collapseLayouts" aria-expanded="false"
                            aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-columns"></i>
                            </div>
                            Layouts
                            <div class="sb-sidenav-collapse-arrow">
                                <i class="fas fa-angle-down"></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                            data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="layout-static.jsp">Static Navigation</a>
                                <a class="nav-link" href="layout-sidenav-light.jsp">Light
                                    Sidenav</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse"
                            data-target="#collapsePages" aria-expanded="false"
                            aria-controls="collapsePages">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-book-open"></i>
                            </div>
                            Pages
                            <div class="sb-sidenav-collapse-arrow">
                                <i class="fas fa-angle-down"></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                            data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion"
                                id="sidenavAccordionPages">
                                <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                    data-target="#pagesCollapseAuth" aria-expanded="false"
                                    aria-controls="pagesCollapseAuth">
                                    Authentication
                                    <div class="sb-sidenav-collapse-arrow">
                                        <i class="fas fa-angle-down"></i>
                                    </div>
                                </a>
                                <div class="collapse" id="pagesCollapseAuth"
                                    aria-labelledby="headingOne"
                                    data-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="login.jsp">Login</a>
                                        <a class="nav-link" href="register.jsp">Register</a>
                                        <a class="nav-link" href="password.jsp">Forgot Password</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                    data-target="#pagesCollapseError" aria-expanded="false"
                                    aria-controls="pagesCollapseError">
                                    Error
                                    <div class="sb-sidenav-collapse-arrow">
                                        <i class="fas fa-angle-down"></i>
                                    </div>
                                </a>
                                <div class="collapse" id="pagesCollapseError"
                                    aria-labelledby="headingOne"
                                    data-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="401.jsp">401 Page</a>
                                        <a class="nav-link" href="404.jsp">404 Page</a>
                                        <a class="nav-link" href="500.jsp">500 Page</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">Addons</div>
                        <a class="nav-link" href="search.jsp">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-chart-area"></i>
                            </div>
                            Search
                        </a>
                        <a class="nav-link" href="tables.jsp">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-table"></i>
                            </div>
                            Tables
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">실 거래가</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">실 거래가</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-body">아파트 및 주택의 실 거래가에 대한 검색 페이지입니다.</div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i> 실거래가
                            <div class="d-flex justify-content-center">
                                <div class="form-check-inline">
                                    <label class="form-check-label"> <input type="checkbox"
                                            class="form-check-input" value="">아파트 매매
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label"> <input type="checkbox"
                                            class="form-check-input" value="">아파트 전월세
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label"> <input type="checkbox"
                                            class="form-check-input" value="">주택 매매
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <label class="form-check-label"> <input type="checkbox"
                                            class="form-check-input" value="">주택 전월세
                                    </label>
                                </div>
                            </div>
                            <div class="text-center">
                                <div class="dropdown">
                                    <div class="btn-group">
                                        <button type="button" id="areaBtn"
                                            class="btn btn-light dropdown-toggle dropdown-toggle-split"
                                            data-toggle="dropdown">지역선택</button>
                                        <div class="dropdown-menu">
                                            <label class="dropdown-item cafe_area">서울</label> <label
                                                class="dropdown-item cafe_area">대전</label> <label
                                                class="dropdown-item cafe_area">구미</label> <label
                                                class="dropdown-item cafe_area">광주</label>
                                        </div>
                                    </div>
                                    <div class="btn-group">
                                        <button type="button" id="officeBtn"
                                            class="btn btn-light dropdown-toggle dropdown-toggle-split"
                                            data-toggle="dropdown">지점선택</button>
                                        <div id="office_div" class="dropdown-menu"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%"
                                    cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>동</th>
                                            <th>전용면적</th>
                                            <th>거래 종류</th>
                                            <th>거래 금액</th>
                                            <th>월세금액</th>
                                            <th>거래일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>330</td>
                                            <td>Apt</td>
                                            <td>$320,800</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                        </tr>
                                        <tr>
                                            <td>Garrett Winters</td>
                                            <td>Accountant</td>
                                            <td>220</td>
                                            <td>Apt</td>
                                            <td>$170,750</td>
                                            <td>63</td>
                                            <td>2011/07/25</td>
                                        </tr>
                                        <tr>
                                            <td>Ashton Cox</td>
                                            <td>Junior Technical Author</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$86,000</td>
                                            <td>66</td>
                                            <td>2009/01/12</td>
                                        </tr>
                                        <tr>
                                            <td>Cedric Kelly</td>
                                            <td>Senior Javascript Developer</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$433,060</td>
                                            <td>22</td>
                                            <td>2012/03/29</td>
                                        </tr>
                                        <tr>
                                            <td>Airi Satou</td>
                                            <td>Accountant</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$162,700</td>
                                            <td>33</td>
                                            <td>2008/11/28</td>
                                        </tr>
                                        <tr>
                                            <td>Brielle Williamson</td>
                                            <td>New York</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$372,000</td>
                                            <td>61</td>
                                            <td>2012/12/02</td>
                                        </tr>
                                        <tr>
                                            <td>Herrod Chandler</td>
                                            <td>San Francisco</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$137,500</td>
                                            <td>59</td>
                                            <td>2012/08/06</td>
                                        </tr>
                                        <tr>
                                            <td>Rhona Davidson</td>
                                            <td>Tokyo</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$327,900</td>
                                            <td>55</td>
                                            <td>2010/10/14</td>
                                        </tr>
                                        <tr>
                                            <td>Colleen Hurst</td>
                                            <td>San Francisco</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$205,500</td>
                                            <td>39</td>
                                            <td>2009/09/15</td>
                                        </tr>
                                        <tr>
                                            <td>Sonya Frost</td>
                                            <td>Edinburgh</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$103,600</td>
                                            <td>23</td>
                                            <td>2008/12/13</td>
                                        </tr>
                                        <tr>
                                            <td>Jena Gaines</td>
                                            <td>London</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$90,560</td>
                                            <td>30</td>
                                            <td>2008/12/19</td>
                                        </tr>
                                        <tr>
                                            <td>Quinn Flynn</td>
                                            <td>Edinburgh</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$342,000</td>
                                            <td>22</td>
                                            <td>2013/03/03</td>
                                        </tr>
                                        <tr>
                                            <td>Charde Marshall</td>
                                            <td>San Francisco</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$470,600</td>
                                            <td>36</td>
                                            <td>2008/10/16</td>
                                        </tr>
                                        <tr>
                                            <td>Haley Kennedy</td>
                                            <td>London</td>
                                            <td>100</td>
                                            <td>Apt</td>
                                            <td>$313,500</td>
                                            <td>43</td>
                                            <td>2012/12/18</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2020</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
        crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
        crossorigin="anonymous"></script>
    <script src="assets/demo/datatables-demo.js"></script>
    <script type="text/javascript">
					$(document)
							.ready(
									function() {
										var cafeArea = {
											"서울" : [ "역삼점", "선릉점" ],
											"대전" : [ "학하점", "봉명점" ],
											"구미" : [ "연수원점", "구미사업장" ],
											"광주" : [ "하남산단점", "광주역점" ]
										};
										$(".dropdown-item.cafe_area")
												.click(
														function() {
															var selArea = $(
																	this)
																	.text();
															$("#areaBtn").text(
																	selArea);
															var offices = cafeArea[selArea];
															$("#office_div")
																	.empty();
															$
																	.each(
																			offices,
																			function(
																					i,
																					office) {
																				$(
																						"#office_div")
																						.append(
																								'<label class="dropdown-item cafe_office">'
																										+ office
																										+ '</label>');
																			});
														});
										$(document).on(
												"click",
												".dropdown-item.cafe_office",
												function() {
													var selOffice = $(this)
															.text();
													$("#officeBtn").text(
															selOffice);
												});
									});
				</script>
</body>
</html>
