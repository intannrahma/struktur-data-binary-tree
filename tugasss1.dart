class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinarySearchTree {
  Node? root;

  // Method untuk menyisipkan nilai ke dalam BST
  void insert(int value) {
    root = _insertRecursive(root, value);
  }

  Node _insertRecursive(Node? node, int value) {
    if (node == null) {
      return Node(value);
    }

    if (value < node.value) {
      node.left = _insertRecursive(node.left, value);
    } else {
      node.right = _insertRecursive(node.right, value);
    }

    return node;
  }

  // Method untuk mendapatkan nilai terkecil (first)
  int? first() {
    if (root == null) return null;

    Node current = root!;
    while (current.left != null) {
      current = current.left!;
    }
    return current.value;
  }

  // Tambahan: inorder traversal untuk lihat isi BST
  void inorderTraversal(Node? node) {
    if (node != null) {
      inorderTraversal(node.left);
      print(node.value);
      inorderTraversal(node.right);
    }
  }

  void printInorder() {
    print("Inorder Traversal:");
    inorderTraversal(root);
  }
}

void main() {
  var bst = BinarySearchTree();

  // Tambahkan data ke BST
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);
  bst.insert(60);
  bst.insert(80);

  // Cetak isi BST
  bst.printInorder();

  // Cetak nilai terkecil
  print("\nNilai terkecil dalam BST: ${bst.first()}");
}
