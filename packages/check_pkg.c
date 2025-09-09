#include <stdbool.h>
#include <stdio.h>
#include <string.h>


bool check_pkg_format(char *str) {
  while (*str) {
    if (*str == '#' || *str == '(' || *str == ')')
      return false;
    str++;
  }
  return true;
}

bool categorized(char *pkg, char (*cpkg_list)[100] ){
  // check if pkg is already categorized or not?
  return true; 
}

int main(int argc, char **argv) {
  const int NUMS_PACKAGE = 300;
  if (argc != 3) {
    printf("Incorrect usage: ./check_pkg <pkg_list> <editting file>");
    return -1;
  }
  char buffer[100];

  // this is file that we are editing and try to categorize pkgs
  printf("----------Categorized packges ----------\n");
  FILE *fptr0;
  fptr0 = fopen(argv[1], "r");
  char categorized_pkg_list[NUMS_PACKAGE][100];
  char (*cpkg_ptr)[100] = categorized_pkg_list; 
  while (fgets(buffer, 100, fptr0)){
    if (!check_pkg_format(buffer))
      printf("yes\n");//printf("%s", buffer);
    cpkg_ptr++;
  }
  printf("---------------------------------------\n");
  
  // Save the pkg in an arrays
  FILE *fptr1;
  fptr1 = fopen(argv[2], "r");
  char pkg_list[NUMS_PACKAGE][100];
  char (*pkg_ptr)[100] = pkg_list;
  printf("---------- List of package ----------\n");
  while (fgets(buffer, 100, fptr1)) {
    strcpy(*pkg_ptr, buffer);
    printf("%s", *pkg_ptr);
    pkg_ptr++;
  }
  printf("-------------------------------------\n");

  fclose(fptr0);
  fclose(fptr1);
  return 0;
}
