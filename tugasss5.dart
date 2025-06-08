import 'dart:io';

class Node {
  String value;
  Node? left;
  Node? right;

  Node(this.value);
}

class ExpressionTree {
  bool isOperator(String c) {
    return ['+', '-', '*', '/', '^'].contains(c);
  }

  int precedence(String op) {
    if (op == '^') return 3;
    if (op == '*' || op == '/') return 2;
    if (op == '+' || op == '-') return 1;
    return 0;
  }

  List<String> infixToPostfix(String expr) {
    List<String> output = [];
    List<String> stack = [];

    final tokens = expr.replaceAll('(', ' ( ').replaceAll(')', ' ) ').split(' ');

    for (var token in tokens) {
      if (token.trim().isEmpty) continue;

      if (!isOperator(token) && token != '(' && token != ')') {
        output.add(token);
      } else if (token == '(') {
        stack.add(token);
      } else if (token == ')') {
        while (stack.isNotEmpty && stack.last != '(') {
          output.add(stack.removeLast());
        }
        stack.removeLast(); // remove '('
      } else {
        while (stack.isNotEmpty &&
            precedence(stack.last) >= precedence(token)) {
          output.add(stack.removeLast());
        }
        stack.add(token);
      }
    }

    while (stack.isNotEmpty) {
      output.add(stack.removeLast());
    }

    return output;
  }

  Node? buildTree(List<String> postfix) {
    List<Node> stack = [];

    for (var token in postfix) {
      if (!isOperator(token)) {
        stack.add(Node(token));
      } else {
        var right = stack.removeLast();
        var left = stack.removeLast();
        var node = Node(token);
        node.left = left;
        node.right = right;
        stack.add(node);
      }
    }

    return stack.isNotEmpty ? stack.first : null;
  }

  void inorder(Node? node) {
    if (node == null) return;
    if (node.left != null || node.right != null) stdout.write("(");
    inorder(node.left);
    stdout.write("${node.value}");
    inorder(node.right);
    if (node.left != null || node.right != null) stdout.write(")");
  }

  void preorder(Node? node) {
    if (node == null) return;
    stdout.write("${node.value} ");
    preorder(node.left);
    preorder(node.right);
  }

  void postorder(Node? node) {
    if (node == null) return;
    postorder(node.left);
    postorder(node.right);
    stdout.write("${node.value} ");
  }
}

void main() {
  var ekspresiList = [
    "A + B - C + D",
    "( A + B ) * ( C - D )",
    "A + ( B - C ) / D * E",
    "A * B - C ^ D + E / F"
  ];

  var tree = ExpressionTree();

  for (var ekspresi in ekspresiList) {
    print("Ekspresi Infix: $ekspresi");
    var postfix = tree.infixToPostfix(ekspresi);
    var root = tree.buildTree(postfix);

    stdout.write("Inorder    : ");
    tree.inorder(root);
    print("");

    stdout.write("Preorder   : ");
    tree.preorder(root);
    print("");

    stdout.write("Postorder  : ");
    tree.postorder(root);
    print("\n" + "-" * 40);
  }
}

