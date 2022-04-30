package 삽입정렬;

public class InsertionSort {

	public static void main(String[] args) {
		int array[] = {8, 5, 6, 2, 4};
		
		for(int i=0; i<(array.length-1); i++){ //4회전
			for(int j=i+1; j>0; j--){
				int key = j;
				if(array[key] < array[j-1]){
					int temp = array[key];
					array[key] = array[j-1];
					array[j-1] = temp;
				}
			}
		}
		
		for(int i : array){
			System.out.print(i+" ");
		}
	}
}