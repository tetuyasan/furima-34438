window.addEventListener('load', () => {
  

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);

  const total = document.getElementById("profit");
   fee = Math.floor(inputValue / 10);
   item_price = (Math.floor(inputValue - fee));
   total.innerHTML = (item_price);
  })
})

