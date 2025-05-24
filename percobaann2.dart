class BinaryTree<T> {
 
  void InOrderDisplay(Node? node) {
    if (node != null) {
      printInOrder(node.left);
      print('${node.key} ');
      printInOrder(node.right);
    }
  }

  void printInOrderFromRoot() {
    InOrderDisplay(root);
  }
}