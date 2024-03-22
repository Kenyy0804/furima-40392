function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 販売手数料の計算
    const taxRate = 0.1; // 販売手数料の税率（例として10%とします）
    const taxAmount = Math.floor(inputValue * taxRate);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = taxAmount;

    // 利益の計算
    const profit = inputValue - taxAmount;
    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = profit;
})
};

window.addEventListener("load", item_price);
window.addEventListener("turbo:render", item_price);