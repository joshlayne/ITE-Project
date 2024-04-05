let days = ["Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Friday","Saturday"]

days.forEach((day,index)=>{
    // Check if the index of day value is equal to the returned value of getDay()
        if(index == new Date().getDay()){
            if (day == "Tuesday") {
                document.getElementById("promo").innerHTML = "Promotion Today!";
            } else {
                document.getElementById("promo").innerHTML = "No promo!"
            }
        }
    }
)