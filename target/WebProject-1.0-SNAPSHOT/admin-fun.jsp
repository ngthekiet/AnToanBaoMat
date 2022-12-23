<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    let clickingMenu = 0;

    function rot() {
        let arrow = document.getElementById("arrow-button");
        let menu = document.getElementById("index_menu-block");
        let leftMenu = document.getElementById("index_clearID");
        let rightMenu = document.getElementById("index_data-contentID");
        if (clickingMenu == 0) {
            arrow.style.transform = "rotate(180deg)";
            menu.style.transform = "translate(-100%)";
            leftMenu.style.width = "0%";
            rightMenu.style.width = "100%";
            clickingMenu = 1;
            return;
        }
        if (clickingMenu == 1) {
            arrow.style.transform = "rotate(0deg)";
            menu.style.transform = "translate(0%)";
            leftMenu.style.width = "20%";
            rightMenu.style.width = "80%";
            clickingMenu = 0;
            return;
        }
    }
</script>
