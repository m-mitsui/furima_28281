// window.addEventListener('oninput', function(){
window.addEventListener('load', function(){
  
  const amount = document.getElementById("item-price");
  const tax_fee = document.getElementById("add-tax-price");
  const gain = document.getElementById("profit");
  //const DOM = document.getElementsByClassName("price-content");

  amount.addEventListener('keyup', function(){

    // ①入力された金額を取得
        let price = amount.value
    // ②手数料と利益を計算

         //price = (300 <= price && price <= 9999999);
        let fee = Math.floor(price / 10);
        let good = (price - fee);
        
    // ③計算結果を表示
        tax_fee.textContent = fee
        gain.textContent = good
        //DOM.innerHTML(good)

        
  })
})
