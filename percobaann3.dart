class BinaryTree<T> {

  void PreOrderDisplay(Node? node) {
    if (node != null) {
      print('${node.key} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  void printPreorderFromRoot() {
    PreOrderDisplay(root);
  }
}
