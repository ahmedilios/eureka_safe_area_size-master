# eureka_safe_area_size

Inherited Widget para disponibilizar acesso ao tamanho da tela com SafeArea.

## Como utilizar?

### `pubspec.yaml`

```yaml
dependencies:
  eureka_safe_area_size:
    git:
      url: ssh://git@gitlab.eurekalabs.com.br:2222/flutter/eureka_safe_area_size.git
```

**É necessário configurar acesso por SSH ao GitLab.**

### Código

O Widget  deve ser construído usando  um LayoutBuilder para obter  as dimensões.
Preferencialmente diretamente como filho do SafeArea                           .

``` dart
class Wrapper extends StatelessWidget {
  final Widget child;

  Wrapper(this.child);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) => SafeAreaSizeInheritor(
            constraints: constraints,
            child: this.child,
          ),
        ),
      );
}
```

Para  obter  os valores  depois  é  só utilizar  as  chamadas  abaixo com  algum
`context` que possua um `SafeAreaSizeInheritor` na árvore.

```dart
final width = SafeAreaSizeInheritor.of(context).constraints.biggest.width;
final height = SafeAreaSizeInheritor.of(context).constraints.biggest.height;
```
