const abc = new Vue({
    el: "#site-wrapper",
    data: {
        shiftRight: false,
        change: false,
        menu : "Menu"
    },
    methods: {
        dpToggleMenu(){
            this.shiftRight = !this.shiftRight;
            this.change = !this.change;
            this.menu = this.change ? 'Close' : 'Menu' ;
        }
    }
})