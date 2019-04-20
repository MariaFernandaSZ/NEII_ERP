var ctx = document.getElementById("gCompras").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: [ "Porcentaje de Productos", "Porcentaje de Devoluciones","Porcentaje de contratos","Porcentaje de facturas pagadas"],
      datasets: [{
        label: "Productos",
        backgroundColor: ["#c45850","#F3E72D","#5DF32D","#2DA5F3"],
        data: [10,20,40,30]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Grafica general'
      }
    }
});