// 자바스크립트 or 자바 선택해서 풀 것!
// 버블정렬을 이용하여 오름차순으로 정렬하고 총 몇회전 했는지 알아내시오.
let array = [1, 10, 4, 3, 5];
let count = 0; //총 몇회전 했는지 알아내는 변수
let isSwap = false;
let len = array.length;
for (let i = len; i > 0; i--) {
  for (let j = 0; j < i - 1; j++) {
    if (array[j] > array[j + 1]) {
      let temp = array[j]; //temp를 사용하지 않으면 i+1번째 배열에 i번째 원소(index 값)를 swap할 수 없다.
      array[j] = array[j + 1];
      array[j + 1] = temp;
      isSwap = true;
      ++count;
    }
  }
  if (!isSwap) break; //더이상 정렬이 없으면 for문 멈춤
}
console.log(array);
console.log(count);
