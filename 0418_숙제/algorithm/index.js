// 자바스크립트 or 자바 선택해서 풀 것!
// 선택정렬을 이용해서 오름차순으로 정렬해보자.
// 선택정렬 관련해서 서치는 좋지만 코드는 직접 풀어봐요! 과정을 중요시 생각합니다 :)
let array = [9, 6, 7, 3, 5];
let len = array.length;
let min;
let temp;
for (let i = 0; i < len - 1; i++) {
  min = i;
  for (let j = i + 1; j < len; j++) {
    if (array[min] > j) {
      min = j;
    }
  }
  console.log(array);
  temp = array[min];
  array[min] = array[i];
  array[i] = temp;
}

console.log(array);
