#Course Lecture 
# Example 06

A new Flutter project that include: ThemeData, Expanded, Container, BoxDecoration, BottomNavigationBar and BottomNavigationBarItem.

## ThemeData class

Defines the configuration of the overall visual Theme for a MaterialApp or a widget subtree within the app.

The MaterialApp theme property can be used to configure the appearance of the entire app. Widget subtrees within an app can override the app's theme by including a Theme widget at the top of the subtree.

Widgets whose appearance should align with the overall theme can obtain the current theme's configuration with Theme.of. Material components typically depend exclusively on the colorScheme and textTheme. These properties are guaranteed to have non-null values.

### References

- [ThemeData Class](https://api.flutter.dev/flutter/material/ThemeData-class.html)

## Expanded class

A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.

Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis (e.g., horizontally for a Row or vertically for a Column). If multiple children are expanded, the available space is divided among them according to the flex factor.

**An Expanded widget must be a descendant of a Row, Column, or Flex**, and the path from the Expanded widget to its enclosing Row, Column, or Flex must contain only StatelessWidgets or StatefulWidgets (not other kinds of widgets, like RenderObjectWidgets).

### References

- [Expanded Class](https://api.flutter.dev/flutter/widgets/Expanded-class.html)

## Container class

A convenience widget that combines common painting, positioning, and sizing widgets.

A container first surrounds the child with padding (inflated by any borders present in the decoration) and then applies additional constraints to the padded extent (incorporating the width and height as constraints, if either is non-null). The container is then surrounded by additional empty space described from the margin.

### References

- [Container Class](https://api.flutter.dev/flutter/widgets/Container-class.html)

## BoxDecoration class

An immutable description of how to paint a box.

The BoxDecoration class provides a variety of ways to draw a box.

The box has a border, a body, and may cast a boxShadow.

The shape of the box can be a circle or a rectangle. If it is a rectangle, then the borderRadius property controls the roundness of the corners.

The body of the box is painted in layers. The bottom-most layer is the color, which fills the box. Above that is the gradient, which also fills the box. Finally there is the image, the precise alignment of which is controlled by the DecorationImage class.

### References

- [BoxDecoration Class](https://flutterassets.com/flutter-basics-how-to-use-a-containers-boxdecoration-in-flutter/)

## BottomNavigationBar class

A material widget that's displayed at the bottom of an app for selecting among a small number of views, typically between three and five.

There is an updated version of this component, NavigationBar, that's preferred for new applications and applications that are configured for Material 3 (see ThemeData.useMaterial3).

The bottom navigation bar consists of multiple items in the form of text labels, icons, or both, laid out on top of a piece of material. It provides quick navigation between the top-level views of an app. For larger screens, side navigation may be a better fit.

A bottom navigation bar is usually used in conjunction with a Scaffold, where it is provided as the Scaffold.bottomNavigationBar argument.

The bottom navigation bar's type changes how its items are displayed. If not specified, then it's automatically set to BottomNavigationBarType.fixed when there are less than four items, and BottomNavigationBarType.shifting otherwise.

### References

- [BottomNavigationBar Class](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)

## BottomNavigationBarItem class

An interactive button within either material's BottomNavigationBar or the iOS themed CupertinoTabBar with an icon and title.

This class is rarely used in isolation. It is typically embedded in one of the bottom navigation widgets above.

### References

- [ButtonNavitaionBarItem](https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html)