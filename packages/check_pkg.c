#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define PKG_LENGHT 100

bool check_pkg_format(char *str) {
  bool valid = false;
  while (*str) {
    if (*str == '#' || *str == '(' || *str == ')')
      return false;
    if (*str != ' ' && *str != '\n')
      valid = true;
    str++;
  }
  return valid;
}

bool check_categorized(char *pkg, char (*cpkg_list)[PKG_LENGHT], int count) {
  pkg[strcspn(pkg, "\n")] = '\0';
  for (int i = 0; i < count; i++) {
    if (strcmp(pkg, *cpkg_list) == 0) {
      return true;
    }
    cpkg_list++;
  }
  return false;
}

void extract_name(char *str) {
  char pkg_name[PKG_LENGHT] = "";
  char *ptr = str;
  int i = 0;
  while (*ptr != '\n') {
    if (*ptr == ' ') {
      ptr++;
      continue;
    }
    pkg_name[i] = *ptr;
    i++;
    ptr++;
  }
  strcpy(str, pkg_name);
}
int main(int argc, char **argv) {
  const int NUMS_PACKAGE = 300;
  int count_cpkg = 0;
  if (argc != 3) {
    printf("Incorrect usage: ./check_pkg <categorized_pkg_list> <pkg_list>");
    return -1;
  }
  char buffer[PKG_LENGHT];

  // this is file that we are editing and try to categorize pkgs
  //printf("----------Categorized packges ----------\n");
  FILE *fptr0;
  fptr0 = fopen(argv[1], "r");
  if (!fptr0) {
    printf("Invalid categorized_pkg_list\n");
    return -1;
  }
  char categorized_pkg_list[NUMS_PACKAGE][PKG_LENGHT];
  char (*cpkg_ptr)[PKG_LENGHT] = categorized_pkg_list;
  while (fgets(buffer, PKG_LENGHT, fptr0)) {
    if (check_pkg_format(buffer)) {
      extract_name(buffer);
      strcpy(*cpkg_ptr, buffer);
      cpkg_ptr++;
      count_cpkg++;
    }
  }
  //printf("%d packages are categorized\n",count_cpkg);
  //printf("---------------------------------------\n");
  fclose(fptr0);

  // Save the pkg in an arrays
  FILE *fptr1;
  int count_pkg = 0;
  fptr1 = fopen(argv[2], "r");
  if (!fptr1) {
    printf("Invalid categorized_pkg_list\n");
    return -1;
  }
  printf("---------- List of uncategorized package ----------\n");
  while (fgets(buffer, PKG_LENGHT, fptr1)) {
    if (!check_categorized(buffer, categorized_pkg_list, count_cpkg)) {
      printf("Not categorized : %s\n", buffer);
      count_pkg++;
    }
  }
  printf("%d packages are uncategorized\n",count_pkg);
  printf("---------------------------------------------------\n");

  fclose(fptr1);
  return 0;
}
