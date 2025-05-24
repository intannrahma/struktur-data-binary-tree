class Node<T> {
  T key;
  Node<T>? left;
  Node<T>? right;

  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

  void inOrderDisplay(Node<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left);
      print('${node.key} ');
      inOrderDisplay(node.right);
    }
  }

  void printInOrderFromRoot() {
    inOrderDisplay(root);
  }

  void preOrderDisplay(Node<T>? node) {
    if (node != null) {
      print('${node.key} ');
      preOrderDisplay(node.left);
      preOrderDisplay(node.right);
    }
  }

  void printPreorderFromRoot() {
    preOrderDisplay(root);
  }

  void postOrderDisplay(Node<T>? node) {
    if (node != null) {
      postOrderDisplay(node.left);
      postOrderDisplay(node.right);
      print('${node.key} ');
    }
  }

  void printPostorderFromRoot() {
    postOrderDisplay(root);
  }
}

void main() {
  BinaryTree<int> t = BinaryTree();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("In Order traversal of binary tree is:");
  t.printInOrderFromRoot();

  print("Pre Order traversal of binary tree is:");
  t.printPreorderFromRoot();

  print("Post Order traversal of binary tree is:");
  t.printPostorderFromRoot();
}
