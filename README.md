# action-helm-for-eks

Based on [alpine/k8s](https://hub.docker.com/r/alpine/k8s) image with Helm, helm-diff, helm-unittest and helm-push.

## Usage
### Updating an helm deployment
```
    - name: Login to Amazon ECR
      id: login-ecr
      uses: aws-actions/amazon-ecr-login@v1
    
    - name: Show diff
      uses: kumojin/action-helm-for-eks@main
      with:
        args: diff upgrade -f custom.values.yml --set image.tag=$GITHUB_SHA my-release my-chart 
    
    - name: Deploy prod
      uses: kumojin/action-helm-for-eks@main
      env:
        CLUSTER_NAME: my-cluster
        AWS_REGION: us-east-1
      with:
        args: upgrade -f custom.values.yml --set image.tag=$GITHUB_SHA my-release my-chart 
```