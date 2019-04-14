
var ctx = document.getElementById("gInventarios").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: [ "Porcentaje de Merma", "Porcentaje de Devoluciones","Porcentaje de compra de producto","Porcentaje de venta de producto"],
      datasets: [{
        label: "Productos",
        backgroundColor: ["#c45850","#F3E72D","#5DF32D","#2DA5F3"],
        data: [30,20,30,20]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Grafica general - Octubre 2018'
      }
    }
});

