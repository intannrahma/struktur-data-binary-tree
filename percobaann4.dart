class BinaryTree<T> {

  void PostOrderDisplay(Node? node) {
    if (node != null) {
      printPostorder(node.left);
      printPostorder(node.right);
      print('${node.key} ');
    }
  }

  void printPostorderFromRoot() {
    PostOrderDisplay(root);
  }
}
