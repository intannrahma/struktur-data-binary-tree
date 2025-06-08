class Node<T> {
  T nodeValue;
  Node<T>? left, right, parent;

  Node(this.nodeValue, [this.parent]);
}

class BinarySearchTree<T extends Comparable> {
  Node<T>? root;
  int treeSize = 0;

   T? getRoot() {
    return root?.nodeValue;
  }

  bool insertdata(T newValue) {
    Node<T>? current = root;
    Node<T>? parent;
    int orderValue = 0;

    while (current != null) {
      parent = current;
      orderValue = newValue.compareTo(current.nodeValue);

      if (orderValue < 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }

    Node<T> newNode = Node(newValue, parent);
    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    treeSize++;
    return true;
  }

  void preOrderNonRekursif() {
    if (root == null) return;

    List<Node<T>> stack = [root!];

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      print('${current.nodeValue}');

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
  }

  void postOrderNonRekursif() {
    if (root == null) return;

    List<Node<T>> stack = [root!];
    List<T> result = [];

    while (stack.isNotEmpty) {
      Node<T> current = stack.removeLast();
      result.insert(0, current.nodeValue);

      if (current.left != null) stack.add(current.left!);
      if (current.right != null) stack.add(current.right!);
    }

    for (var val in result) {
      print(val);
    }
  }

  void inOrderTraversal(Node<T>? node) {
    if (node == null) return;

    inOrderTraversal(node.left);
    print('${node.nodeValue}');
    inOrderTraversal(node.right);
  }
}

void main() {
  BinarySearchTree<int> bst = BinarySearchTree<int>();

  bst.insertdata(30);
  bst.insertdata(45);
  bst.insertdata(20);

  print('\nRoot dari tree: ${bst.getRoot()}'); // Output: 30

  print('\nPreorder (Non-Rekursif):');
  bst.preOrderNonRekursif();

  print('\nInorder (Rekursif):');
  bst.inOrderTraversal(bst.root);

  print('\nPostorder (Non-Rekursif):');
  bst.postOrderNonRekursif();
}
