// 자바스크립트 or 자바 선택해서 풀 것!
// 버블정렬을 이용하여 오름차순으로 정렬하고 총 몇회전 했는지 알아내시오.
let array = [1, 10, 4, 3, 5];
let count = 0; //총 몇회전 했는지 알아내는 변수

let len = array.length;
// let temp = 0;
// for (let i = 0; i < len; i++) {
//   for (let j = 0; j < len - 1; j++) {
//     if (array[i] < array[j]) {
//       ++count;
//       temp = array[i];
//       array[i] = array[j];
//       array[j] = temp;
//     }
//   }
// }

// let, var 차이
var name = "중복가능";
var name = "중복가능";

let name3 = "중복불가능";
let name2 = "중복불가능";

//선생님 풀이

// for (let i = len; i > 0; i--) {
//   //outer for문: 4번돌아야한다.
//   for (let j = 0; j < len - 1; j++) {
//     //inner for문 outer for문이 회전할때마다 1씩 감소해야한다.
//   }
// }

let isSwap = false;
for (let i = len; i > 0; i--) {
  // console.log(i);
  for (let j = 0; j < i - 1; j++) {
    if (array[j] > array[j + 1]) {
      let result = array[j]; //큰수
      array[j] = array[j + 1];
      array[j + 1] = result;
      ++count;
      isSwap = true;
    }
  }
  if (!isSwap) break;
}

console.log(array);
console.log(count);
//규칙을 찾아야한다.
// =>1씩 감소하는구나.
//손으로 먼저 그려본다.

//한번 풀어보기
let temp = 0;
for (let i = len; i > 0; i--) {
  for (let j = 0; j < i - 1; j++) {
    if (array[j] > array[j + 1]) {
      temp = array[j];
      array[j] = array[j + 1];
      array[j + 1] = temp;
    }
  }
}
console.log(array);
