class Node {
  int key;
  Node? left;
  Node? right;

  Node(this.key);
}

class BinarySearchTree {
  Node? root;

  void insert(int key) {
    root = _insertRecursive(root, key);
  }

  Node _insertRecursive(Node? node, int key) {
    if (node == null) {
      return Node(key);
    }
    if (key == node.key) {
      print('Nilai $key sudah ada, tidak ditambahkan (duplikat).');
      return node; // Tidak tambah duplikat
    } else if (key < node.key) {
      node.left = _insertRecursive(node.left, key);
    } else {
      node.right = _insertRecursive(node.right, key);
    }
    return node;
  }

  void inorderTraversal() {
    _inorderRecursive(root);
    print('');
  }

  void _inorderRecursive(Node? node) {
    if (node != null) {
      _inorderRecursive(node.left);
      print('${node.key} ',);
      _inorderRecursive(node.right);
    }
  }
}

void main() {
  var bst = BinarySearchTree();
  var nodesToInsert = [30, 15, 17, 36, 67, 30, 69];

  for (var value in nodesToInsert) {
    bst.insert(value);
  }

  print('Inorder traversal hasil BST:');
  bst.inorderTraversal();
}
