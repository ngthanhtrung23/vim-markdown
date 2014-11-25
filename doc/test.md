<!-- Example highlight -->

In this file, you can find some example of what this plugin can highlight

# Heading 1
## Heading 2
### Heading 3

This is a list
* item 1
* item 2
* item 3
    - bla
    - bla
    - bla

*star* _underscore_

```cpp
#define FOR(i,a,b) for(int i=(a),_b=(b); i < _b; ++i)
int main() {
    // This is a comment
    for(int i = 0; i < 3; ++i) {
    }
}
```

```java
public class Main {
    public static void main(String[] args) {
        // Do something
    }
}
```

```python
# method hello
def hello():
    """
    docstring!
    """
    a = 3
    world = "world"
    print "Hello {}".format(world)
```

```ruby
# a comment
def hello
  my_var = 3
  puts "my_var = #{my_var}"
end
```

```vim
" C/C++:
function! CSET()
  set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ gcc\ -O2\ -g\ -Wall\ -Wextra\ -o%.bin\ %\ -lm;fi;fi
  set cindent
  set textwidth=0
  set nowrap
endfunction
```

```
some code
```

```sql
USE voj;
DESCRIBE tables;
SELECT * FROM users_user;
```

```sh
for i in {1..3};
do
    echo "Hello, $i"
done
```
