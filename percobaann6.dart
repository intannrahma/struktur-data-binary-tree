class BinaryTree<T> {

  void printLevelOrder() {
    int h = height(root);
    for (int i = 0; i <= h; i++) {
      printCurrentLevel(root, i);
    }
  }

  int height(Node? root) {
    if (root == null) {
      return 0;
    } else {
      int lheight = height(root.left);
      int rheight = height(root.right);
      return lheight > rheight ? lheight + 1 : rheight + 1;
    }
  }

  void printCurrentLevel(Node? root, int level) {
    if (root != null) {
      if (level == 0) {
        print('${root.key} ');
      } else if (level >= 1) {
        printCurrentLevel(root.left, level - 1);
        printCurrentLevel(root.right, level - 1);
      }
    }
  }
}
