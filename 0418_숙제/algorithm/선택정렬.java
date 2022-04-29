package 자습;

import java.util.Arrays;

public class SelecttionSort {

	public static void main(String[] args) {

		int array[] = {9,6,7,3,5};
		boolean isChange = false; //교환 여부 판단!
		//4번 회전!
		//1회전 : 4번 배열값 체크(최솟값을 찾자!)
		
		for(int i=0; i<array.length-1;i++) {//4회전 세팅완료
			
		}
		//최솟값 구해보기
//		int min = array[0]; //9가 들어가있음!
//		for(int i=1; i<array.length;i++) {
//			//작으면...
//			if(min > array[i]) {
//				min = array[i];
//			}
//		}
//		System.out.println(min);
		for(int i=0; i<array.length-1;i++) {
			int min = array[i]; //0번째 원소를 초기값으로 세팅!
			int index = 0; //최솟값 위치.
			for(int j=i+1; j<array.length;j++) {
				if(min > array[j]) {
					min = array[j];
					index = j;
					isChange = true; //최솟값이 있음!
				}
			}
			if(!isChange) continue;
			if(isChange) {
				int temp = array[i];
				array[i] = min;
				array[index] = temp;
			}
		}
		//변수가 많은 코드를 디버깅 코드라고 한다.
		System.out.println(Arrays.toString(array));
	}

}
