<style>
    #menu_bar {
        /* border: 3px solid red; */
        width: 90%;
        margin: 5px auto;
    }

    .menu_item {
        border: 1px solid rgb(36, 134, 195);
        display: inline-block;
        padding: 5px 12px;
        border-radius: 5px;
    }
    
    .menu_item a:link {
        text-decoration: none;
        color: rgb(56, 124, 206);
    }
    
    .menu_item:link,.menu_item:visited {
        background-color: #fff;
        color: rgb(56, 124, 206);
    }

    .menu_item:hover {
        background-color: rgb(56, 124, 206);
        color: white;
    }

    .menu_item:active {
        background-color: rgb(56, 124, 206);
        color: white;
    }
</style>

<div id="menu_bar">
    <div class="menu_item">
        <a href="show.do">Show Products</a>
    </div>
    <div class="menu_item">
        <a href="add.do">Add Product</a>
    </div>
</div>