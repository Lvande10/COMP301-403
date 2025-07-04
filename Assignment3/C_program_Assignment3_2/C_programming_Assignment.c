#include <stdio.h>
#include <math.h>

int calculateMinimum(int nums[], int numsLength){
   int min;

  for (int i = 0; i < numsLength; i++) {
    if (i == 0) {
      min = nums[i];
    } else if (nums[i] < min) {
      min = nums[i];
    }
  }

  return min;
}

int calculateMaximum(int nums[], int numsLength){
   int max;

  for (int i = 0; i < numsLength; i++) {
    if (i == 0) {
      max = nums[i];
    } else if (nums[i] > max) {
      max = nums[i];
    }
  }

  return max;
}

char getGradeChar(int num){
  if (num >= 90 && num <= 100){
    return 'A';
  } else if (num >= 80 && num <= 89) {
    return 'B';
  } else if (num >= 70 && num <= 79) {
    return 'C';
  } else if (num >= 60 && num <= 69) {
    return 'D';
  } else if (num >= 0 && num <= 59) {
    return 'F';
  } else {
    return 'X'; // invalid route. But if the program is used correctly, this should never happen.
  }
}




int main ()
{
  int cor1, cor2, cor3, cor4, cor5;
  int avg, min, max;
  char avgChar, minChar, maxChar;

  printf("\n Enter the course1: ");
  scanf("%d", &cor1);

  printf("\n Enter the course2: ");
  scanf("%d", &cor2);

  printf("\n Enter the course3: ");
  scanf("%d", &cor3);
  
  printf("\n Enter the course4: ");
  scanf("%d", &cor4);

  printf("\n Enter the course5: ");
  scanf("%d", &cor5);

  // hold in array to use for calculation later.
  int cor_array[5] = {cor1, cor2, cor3, cor4, cor5};

  FILE *fptr;

  fptr = fopen("grades.txt", "a");

  int cor_array_length = sizeof(cor_array) / sizeof(cor_array[0]);

  avg=(cor1 + cor2 + cor3 + cor4 + cor5) / 5;

  min = calculateMinimum(cor_array, cor_array_length);
  max = calculateMaximum(cor_array, cor_array_length);


  fprintf(fptr, "\n This is assignment 3.2 (C Programming Assignment) - Lucas Vandermaarel - 301482828");
  fprintf(fptr, "\n The grades entered are: %c (%d), %c (%d), %c (%d), %c (%d), %c (%d)", getGradeChar(cor1), cor1, getGradeChar(cor2), cor2, getGradeChar(cor3), cor3, getGradeChar(cor4), cor4, getGradeChar(cor5), cor5);
  fprintf(fptr, "\n The average of the grades is %c (%d)", getGradeChar(avg), avg);
  fprintf(fptr, "\n The minimum of the grades is %c (%d)", getGradeChar(min), min);
  fprintf(fptr, "\n The maximum of the grades is %c (%d)\n", getGradeChar(max), max);

  fclose(fptr); 

  return 0;
}


