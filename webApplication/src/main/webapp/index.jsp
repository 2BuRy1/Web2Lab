<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LABA</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100..900&family=Pixelify+Sans:wght@400..700&family=SUSE:wght@100..800&display=swap"
          rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Pixelify Sans", sans-serif;
        }

        body {
            background-color: #ffe5ec;

        }

        header {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            grid-template-rows: repeat(2, 1fr);
            grid-column-gap: 0;
            grid-row-gap: 0;
        }

        .credits {
            grid-area: 1 / 1 / 2 / 5;
        }

        .group {
            grid-area: 1 / 5 / 2 / 6;
        }

        .id {
            grid-area: 2 / 5 / 3 / 6;
        }

        main {
            display: grid;
            height: 600px;
            grid-template-columns: auto auto;
        }


        .thirdColumn {


            height: auto;
            display: grid;
            grid-template-columns: auto;
            grid-template-rows: repeat(4, auto);
            font-size: 20px;

        }


        .canvasContainer {
            width: 100%;
            display: grid;
            place-content: center;
            place-items: center;
            grid-template-rows: 25% 50%;
            font-size: 20px;

            canvas {
                border: black solid;
                border-radius: 10%;
            }


        }

        input, select, .variables, .canvasContainer, button{
            transition: ease-in-out .2s;
        }

        input:hover, select:hover, button:hover{
            filter: drop-shadow(0 0 2px red );
        }


        .canvasContainer p {
            height: 50%;


        }

        .variables {
            font-size: 20px;
            background-color: #ffd3e4;
            height: 100%;
            width: 100%;
            display: grid;
            grid-template-rows: 42% 200px;
            place-items: center;
            border-radius: 10%;
            padding: 0;

        }

        .form {
            height: 100%;
            width: 100%;
            display: grid;
            place-content: center;
            grid-template-columns: 200px 300px 200px;
            place-items: center;
            font-size: 100%;
        }

        footer {
            display: grid;
            grid-template-columns: 50% 50%;
            justify-items: center;

        }

        .form p {
            font-size: 20px;

        }

        .form input {
            font-size: 20px;
            border: 0.5px solid black;
            border-radius: 30px;
        }



        form > button {
            width: 100%;
        }


        table {
            width: 300px;
            height:fit-content;
            max-height: 50px;
            overflow: scroll;
        }

        thead {
            visibility: hidden;
        }

        thead.visible {
            visibility: visible;
        }

        td, th {
            opacity: 0;
            animation: ani 1s forwards;
            padding: 0;
            text-align: center;
            height: 70px;
            border: solid black;
            border-radius: 4px;
            transition: ease-in-out .2s;

        }

        td:hover, th:hover{
            transform: scale(1.3, 1.3);

        }

        @keyframes ani {
            0% {opacity: 0;}
            100% {opacity: 1;}
        }



        status {
            visibility: hidden;

        }

        status.visible {
            visibility: visible;

        }

        select {
            border: 0.5px solid black;
            border-radius: 10px;
            height: 25px;
            width: 100px;

        }

        .variables:hover, .canvasContainer:hover{
            transform: translate( -5px ,-5px);
            filter: drop-shadow(10px 10px 10px rgba(0, 0, 0, 0.5));
        }


        .error{
            background-color: #ffd3ff;

        }

        .tableContainer{
            height: fit-content;
            max-height: 200px;
            overflow-y: scroll;
        }


        .tableContainer::-webkit-scrollbar {
            width: 10px;
            background-color: #f9f9fd;
        }

        .tableContainer::-webkit-scrollbar-thumb {
            border-radius: 10px;
            background-color: #18aaaa;
        }

        .tableContainer::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.2);
            border-radius: 10px;
            background-color: #f9f9fd;
        }




    </style>


</head>
<body>

<header>
    <h1 class="credits">Федоров Евгений Константинович</h1>
    <h1 class="group">P3210</h1>
    <h1 class="id">488124</h1>
</header>


<main>
    <div class="variables">
        <p>Variables</p>
        <div class="form" id="form" >

            <label for="xSelection">
                <p>X</p><select id="xSelection">
                <option value="-3">-3</option>
                <option value="-2">-2</option>
                <option value="-1">-1</option>
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
            </label>
            <div>
                <label for="ySelection">
                    <p>Y</p>
                    <input type="text" name="y" id="ySelection" required placeholder="-3...5">
                </label>
            </div>
            <div class="thirdColumn">
                <p>R</p>
                <label for="r1"><input type="checkbox" value="1" id="r1" class="checkboxes" name="Radius">1</label>
                <label for="r2"><input type="checkbox" value="2" id="r2" class="checkboxes" name="Radius">2</label>
                <label for="r3"><input type="checkbox" value="3" id="r3" class="checkboxes" name="Radius">3</label>
                <label for="r4"><input type="checkbox" value="4" id="r4" class="checkboxes" name="Radius">4</label>
                <label for="r5"><input type="checkbox" value="5" id="r5" class="checkboxes" name="Radius">5</label>
            </div>
            <button type="button" onclick="submit()" >Отправить</button>
        </div>
    </div>

    <div class="canvasContainer">
        <p>Graphic</p>
        <canvas width="400" height="400" id="canvas"></canvas>
    </div>
</main>
<footer>
    <div class = 'tableContainer'>
        <table id="table-sector">
            <thead id="table-header">
            <tr>
                <th>x</th>
                <th>y</th>
                <th>R</th>
                <th>status</th>
                <th>Current time</th>
                <th>Spent time</th>
            </tr>
            </thead>
            <tbody id = "table_body">


            </tbody>


        </table>
    </div>
    <status class="status"></status>
</footer>
<script src="canvas.js"></script>
<script src="script.js"></script>
</body>
</html>