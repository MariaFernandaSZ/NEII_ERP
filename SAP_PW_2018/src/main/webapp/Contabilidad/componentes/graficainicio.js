var ctx = document.getElementById("Gconta").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: [ "Enero", "Marzo","Mayo","Julio","Septiembre", "Noviembre"],
      datasets: [{
        label: "Ganancias",
        backgroundColor: ["#c45850","#F3E72D","#5DF32D","#2DA5F3","#783AC8","#3AC8BD"],
        data: [15,20,10,25,18,12]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Grafica general de ganancias bimestrales 2018'
      }
    }
});

