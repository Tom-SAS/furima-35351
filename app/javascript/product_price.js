window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const addTaxDom = document.getElementById('add-tax-price');
  tax = priceInput.value * 0.1
  addTaxDom.innerHTML = Math.floor( tax );
  profit = priceInput.value * 0.9
  const addProfitDom = document.getElementById('profit');
  addProfitDom.innerHTML = Math.floor( profit );

})

});