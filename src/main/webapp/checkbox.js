

let form = document.querySelector("#form__wrap");//폼값
let all = document.querySelector("#checkAll");//전부 동의버튼
let checkBoxes = document.querySelectorAll(".input__check");//각자 동의버튼 all로받음
let submitButton = document.querySelector("button"); //submit버튼
console.log(all)
const agreements = {
  termsOfService: false,
  privacyPolicy: false,   
  allowPromotions: false
};

//form.addEventListener("submit", (e) => e.preventDefault());//폼제출이벤트 막는함수 

checkBoxes.forEach((item) => item.addEventListener("change", toggleCheckbox));//함수 이벤트일어날때마다 각각 
																				//토글체크박스함수 실행 

function toggleCheckbox(e) {
  console.log("========")
  const { checked, id } = e.target;
  agreements[id] = checked;
  this.parentNode.classList.toggle("active");
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { termsOfService, privacyPolicy, allowPromotions } = agreements;
  if (termsOfService && privacyPolicy && allowPromotions) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { termsOfService, privacyPolicy } = agreements;
  if (termsOfService && privacyPolicy) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

document.querySelector("#checkAll").addEventListener("click", (e) => {
  let checked = document.querySelector("#checkAll").checked
  console.log(checked)
  if (checked) {
    checkBoxes.forEach((item) => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add("active");
    });
  } else {
    checkBoxes.forEach((item) => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove("active");
    });
  }
  toggleSubmitButton();
});