<%@ page import="database.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Trang chủ | Cloudy Drinks</title>
    <link rel="icon" type="image/x-icon" href="https://i.imgur.com/P5Z5eYv.png">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"
    ></script>

    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/home.css" />
</head>
<body>
<div class="page_container">
    <%@include file="./components/header.jsp" %>

    <!-- #region Slide show -->
    <div class="slide-show_container">
        <div class="timer-bar"><div></div></div>
        <%
            NewsDAO newsDAO = new NewsDAO();
            ArrayList<News> newsList = newsDAO.select3NewNews();
            for (News news : newsList) {
        %>
        <div class="slides fadeIn">

            <div
                    class="banner"
                    style="
              background-image: url(<%=news.getImg()%>);
            "
            ></div>
        </div>
        <%
            }
        %>
        <button class="prev">❮</button>
        <button class="next">❯</button>

        <div class="slide-control_wrapper">
            <button class="dot"></button>
            <button class="dot"></button>
            <button class="dot"></button>
        </div>
    </div>
    <!-- #endregion -->

    <!--  -->
    <div class="content_container">
        <!-- #region Sản phẩm mới -->
        <div class="list-product_container">
            <div class="list-product_wrapper d-flex">
                <div class="list-product_header d-flex flex-column gap-3">
                    <h2 class="title">Sản phẩm mới</h2>
                    <div class="icon">
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="80"
                                height="80"
                                fill="currentColor"
                                class="bi bi-arrow-right-circle"
                                viewBox="0 0 16 16"
                        >
                            <path
                                    fill-rule="evenodd"
                                    d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"></path>
                        </svg>
                    </div>
                </div>
                <div class="list-product_content d-flex gap-3 gap-lg-4">
                    <%
                        ProductDAO productDAO = new ProductDAO();
                        ArrayList<Product> newProducts = productDAO.select6NewProduct();
                        for (Product p : newProducts) {
                    %>
                    <a href="<%=url%>/product-controller?pid=<%=p.getProductId()%>" class="product_container card">
                        <img
                                src="<%=p.getProductImage()%>"
                                class="card-img-top"
                                alt="<%=p.getProductName()%>"
                        />
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getProductName()%></h5>
                        </div>
                    </a>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <!-- #endregion -->
    </div>
</div>

<script src="./js/home.js"></script>
</body>
</html>