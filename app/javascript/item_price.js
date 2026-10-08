const price = () => {
  const priceInput = document.getElementById('item-price');
  const addTaxDom = document.getElementById('add-tax-price');
  const profitDom = document.getElementById('profit')

  if (!priceInput || !addTaxDom || !profitDom) return;

  const calculatePrice = () => {
    const inputValue = Number(priceInput.value);
    const tax = Math.floor(inputValue / 10);

    addTaxDom.innerHTML = tax;
    profitDom.innerHTML = inputValue - tax;
  };
  
  priceInput.addEventListener("input", calculatePrice);

  calculatePrice();
};


window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
