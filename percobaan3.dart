class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;
}

void printPreOrder(Node? node) {
  if (node != null) {
    print("${node.nodeValue}");
    printPreOrder(node.left);
    printPreOrder(node.right);
  } else {
    print("Binary Tree Kosong");
  }
}

void inOrderNonRekursif() {
  if (root == null) return;

  List<Node> stack = [];
  Node? curr = root;

  while (curr != null || stack.isNotEmpty) {
    while (curr != null) {
      stack.add(curr); // add sama dengan push di stack
      curr = curr.left;
    }

    // pop subtree sebelah kiri
    curr = stack.removeLast(); // sama dengan pop di stack
    stdout.write('${curr.nodeValue} '); // cetak di root
    curr = curr.right; // lakukan di subtree sebelah kanan
  }
}
