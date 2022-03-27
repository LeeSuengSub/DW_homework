// 자바스크립트 or 자바 선택해서 풀 것!
// 버블정렬을 이용하여 오름차순으로 정렬하고 총 몇회전 했는지 알아내시오.
let array = [1, 10, 4, 3, 5];
let count = 0; //총 몇회전 했는지 알아내는 변수

let len = array.length;
let temp = 0;
for (let i = 0; i < len; i++) {
  for (let j = 0; j < len - 1; j++) {
    if (array[i] < array[j]) {
      ++count;
      temp = array[i];
      array[i] = array[j];
      array[j] = temp;
    }
  }
}

console.log(array);
console.log(count);
